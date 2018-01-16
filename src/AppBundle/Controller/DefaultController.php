<?php

namespace AppBundle\Controller;

use AppBundle\AppBundle;
use AppBundle\Entity\Commentaires;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        $data = 'Hello World';
        // replace this example code with whatever you need
        return $this->render('AppBundle:default:index.html.twig', [
            'welcom' => $data
        ]);
    }

    /**
     * @Route("/cv", name="cv")
     */
    public  function  cv(Request $request)
    {
        return $this->render('AppBundle:default:cv.html.twig',[]);
    }

    /**
 * @Route("/competences", name="competences")
 */
    public  function  competences(Request $request)
    {
        $competences = $this->getDoctrine()
            ->getRepository('AppBundle:Competences')
            ->findAll();

        return $this->render('AppBundle:default:competences.html.twig', [
            'comp' => $competences
        ]);
    }

    /**
     * @Route("/moi", name="moi")
     */
    public function scolarite(Request $request)
    {
        $sco = $this->getDoctrine()
            ->getRepository('AppBundle:Scolarite')
            ->findAll();

        return $this->render('AppBundle:default:moi.html.twig',[
            'scol' => $sco
        ]);
    }

    /**
     * @Route("/blog", name="blog")
     */
    public function blog (Request $request)
    {

        $blogs = $this->getDoctrine()
            ->getRepository('AppBundle:Blog')
            ->findAll();

        return $this->render('AppBundle:default:blog.html.twig', [
            'art' => $blogs
        ]);
    }

    /**
     * @Route("/article/{id}", name="article", requirements={"id"="\d+"})
     */
    public function article (Request $request, $id)
    {

        $article = $this->getDoctrine()
            ->getRepository('AppBundle:Blog')
            ->find($id);

        $comments = $this->getDoctrine()->getRepository('AppBundle:Commentaires')->findAllValidComments($id);

        $comment = new Commentaires();
        $form = $this->createFormBuilder($comment)
            ->add('pseudo', TextType::class)
            ->add('commentaire', TextareaType::class)
            ->add('idArticle', HiddenType::class, ['data' => $id])
            ->add('Commenter', SubmitType::class)
            ->getForm();

        $form->handleRequest($request);

        if ($form->isSubmitted())
        {
            $comm = $form->getData();
            $co = $this->getDoctrine()->getManager();
            $co->persist($comm);
            $co->flush();
        }

        return $this->render('AppBundle:default:article.html.twig', [
            'art' => $article,
            'form' => $form->createView(),
            'coms' => $comments
        ]);
    }
}
