<?php

namespace Api\Model\Repository;

use Api\AplicacaoBundle\Service\UsuarioService;
use Doctrine\Common\Util\Debug;
use Doctrine\ORM\AbstractQuery;
use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Query\Expr\Join;

class RamRepository extends EntityRepository
{ /**
 * @return array
 */
    public function all(...$params): array
    {
        $builder = $this->createQueryBuilder('r')
            ->select(
                '
                r.id,
                r.size as name,
                r.sizeType,
                rt.description
                '
            )
            ->innerJoin('r.ramType', 'rt')
            ->orderBy('r.size', 'ASC')
            ->getQuery();

        return $builder->getArrayResult();
    }
}