<?php

namespace AppBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;

class CompetencesAdmin extends AbstractAdmin
{
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper->add('icon', TextType::class, ['label' => 'Icon'])
            ->add('title', TextareaType::class, ['label' => 'Titre'])
            ->add('liste', TextareaType::class, ['label' => 'Liste des compétences']);
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper->add('icon')->add('title')->add('liste');
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper->addIdentifier('icon')->add('title')->add('liste');
    }
}