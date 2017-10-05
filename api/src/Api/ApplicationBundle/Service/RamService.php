<?php

namespace Api\ApplicationBundle\Service;

use Api\ApplicationBundle\Service\Exception\ServerException;
use Doctrine;
use App\CoreBundle\Service\Service;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\ORMException;

class RamService extends Service
{

    /**
     * @return \Api\Model\Repository\ServerRepository
     */
    protected function getRepository(): Doctrine\Common\Persistence\ObjectRepository
    {
        return $this->entityManager->getRepository('ApiModel:Ram');
    }
    /**
     * @param $parametros
     * @return mixed
     * @throws ServerException
     */
    public function all(...$parametros): array
    {
        try {
            return $this->getRepository()->all($parametros);

        } catch (Doctrine\DBAL\DBALException $DBALe) {
            throw new ServerException($DBALe->getMessage(), 500);
        } catch (ORMException $ormE) {
            throw new ServerException($ormE->getMessage(), 500);
        }
    }

}
