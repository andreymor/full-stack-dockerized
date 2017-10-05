<?php

namespace Api\Model\Repository;

use Api\AplicacaoBundle\Service\UsuarioService;
use Doctrine\Common\Util\Debug;
use Doctrine\ORM\AbstractQuery;
use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Query\Expr\Join;

class HddTypeRepository extends EntityRepository
{
    /**
     * @return array
     */
    public function all(...$params): array
    {
        $builder = $this->createQueryBuilder('ht')
            ->select(
                '
                ht.id,
                ht.description as name
                '
            )
            ->getQuery();

        return $builder->getArrayResult();
    }
}