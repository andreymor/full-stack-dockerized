<?php

namespace Api\Model\Repository;

use Api\AplicacaoBundle\Service\UsuarioService;
use Doctrine\Common\Util\Debug;
use Doctrine\ORM\AbstractQuery;
use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Query\Expr\Join;

class ServerRepository extends EntityRepository
{
    /**
     * @return array
     */
    public function all(...$params): array
    {
        $builder = $this->createQueryBuilder('t')
            ->select(
                '
                    t.model,
                    t.modelType,
                    t.hddQuantity,
                    t.price,
                    hdd.id as hddId,
                    hdd.sizeType as hddSizeType,
                    hdd.size as hddSize,
                    (hdd.size * t.hddQuantity) as totalHddSize,
                    CASE hdd.sizeType
                        WHEN \'TB\' THEN (hdd.size/1000) * t.hddQuantity
                        ELSE hdd.size * t.hddQuantity
                    END as storage,
                    hddt.id as hddTypeId,
                    hddt.description as hddType,
                    concat(t.hddQuantity, \'x\', hdd.size) as hddFull, 
                    concat(ram.size, ram.sizeType) as ramFull,
                    ram.id as ramId,
                    ramt.description as ramType,
                    ram.size as ramSize, 
                    location.id as locationId,
                    location.initials as locationInitials,
                    location.code as locationCode,
                    location.name as locationName,
                    concat(location.initials, \'-\', location.code) as locationFull 
                '
            )
            ->innerJoin('t.hdd', 'hdd')
            ->innerJoin('hdd.hddType', 'hddt')
            ->innerJoin('t.ram', 'ram')
            ->innerJoin('ram.ramType', 'ramt')
            ->innerJoin('t.location', 'location')
            ->getQuery();

        return $builder->getArrayResult();
    }
}