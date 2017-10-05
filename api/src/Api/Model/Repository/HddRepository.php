<?php

namespace Api\Model\Repository;

use Api\AplicacaoBundle\Service\UsuarioService;
use Doctrine\Common\Util\Debug;
use Doctrine\ORM\AbstractQuery;
use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Query\Expr\Join;

class HddRepository extends EntityRepository
{
    /**
     * @return array
     */
    public function all(...$params): array
    {
        $builder = $this->createQueryBuilder('h')
            ->select(
                '
                h.id,
                h.size as name,
                h.sizeType,
                ht.description
                '
            )
            ->innerJoin('h.hddType', 'ht')
            ->orderBy('h.size', 'asc')
            ->getQuery();

        return $builder->getArrayResult();
    }
}