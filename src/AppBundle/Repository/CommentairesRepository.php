<?php

namespace AppBundle\Repository;

/**
 * CommentairesRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class CommentairesRepository extends \Doctrine\ORM\EntityRepository
{
    public function findAllValidComments($idArt)
    {
        $cc = $this->createQueryBuilder('c');
        $cc->where('c.idArticle LIKE :idArt');
        $cc->andWhere('c.is_valid = 1');
        $cc->setParameter('idArt', $idArt);

        return $cc->getQuery()->getArrayResult();
    }
}
