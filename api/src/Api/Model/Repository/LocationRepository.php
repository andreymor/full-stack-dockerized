<?php

namespace Api\Model\Repository;

use Api\AplicacaoBundle\Service\UsuarioService;
use Doctrine\Common\Util\Debug;
use Doctrine\ORM\AbstractQuery;
use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Query\Expr\Join;

class LocationRepository extends EntityRepository
{ /**
 * @return array
 */
    public function all(...$params): array
    {
        $builder = $this->createQueryBuilder('l')
            ->select(
                '
                l.id,
                l.name,
                l.initials,
                l.code
                '
            )
            ->getQuery();

        return $builder->getArrayResult();
    }
}