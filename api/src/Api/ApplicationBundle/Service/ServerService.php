<?php

namespace Api\ApplicationBundle\Service;

use Api\ApplicationBundle\Service\Exception\ServerException;
use Doctrine;
use App\CoreBundle\Service\Service;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\ORMException;

class ServerService extends Service
{

    /**
     * @return \Api\Model\Repository\ServerRepository
     */
    protected function getRepository(): Doctrine\Common\Persistence\ObjectRepository
    {
        return $this->entityManager->getRepository('ApiModel:Server');
    }

    /**
     * @param $id
     * @return mixed
     * @throws ServerException
     */
    public function getServer($id)
    {
        try {
            return $this->getRepository()->getServer($id);
        } catch (Doctrine\DBAL\DBALException $DBALe) {
            throw new ServerException($DBALe->getMessage(), 500);
        } catch (ORMException $ormE) {
            throw new ServerException($ormE->getMessage(), 500);
        }
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

    /**
     * @param Request $request
     * @throws ServerException
     */
    public function save(Request $request)
    {
        try {
            $entity = $this->deserialize('Api\Model\Entity\Server', $request);
            $this->getEntityManager()->persist($entity);
            $this->getEntityManager()->flush();
        } catch (Doctrine\DBAL\DBALException $DBALe) {
            throw new ServerException($DBALe->getMessage(), 500);
        } catch (ORMException $ormE) {
            throw new ServerException($ormE->getMessage(), 500);
        }
    }

    /**
     * @param $id
     * @throws ServerException
     */
    public function delete($id)
    {
        try {
            $entity = $this->getRepository()->find($id);
            $this->getEntityManager()->remove($entity);
            $this->getEntityManager()->flush();
        } catch (Doctrine\DBAL\DBALException $DBALe) {
            throw new ServerException($DBALe->getMessage(), 500);
        } catch (ORMException $ormE) {
            throw new ServerException($ormE->getMessage(), 500);
        }
    }

}
