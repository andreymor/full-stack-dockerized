<?php
namespace App\CoreBundle\Service;

use \Doctrine\ORM\EntityManager;
use JMS\Serializer\Serializer;
use JMS\Serializer\SerializerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Negotiation\Exception\InvalidArgument;
use \Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\Validator\Validator\ValidatorInterface;

abstract class Service implements ServiceInterface
{
    /**
     * @var \Doctrine\ORM\EntityManager
     */
    protected $entityManager;

    /**
     * @var
     */
    protected $paginator;

    /**
     * @var
     */
    protected $serializer;

    /**
     * @var
     */
    protected $validator;

    /**
     * @param EntityManager $entityManager
     */
    public function __construct(EntityManager $entityManager, SerializerInterface $serializer, ValidatorInterface $validator, PaginatorInterface $paginator = null)
    {
        $this->entityManager = $entityManager;
        $this->serializer = $serializer;
        $this->validator = $validator;
        $this->paginator = $paginator;
    }

    /**
     * @param $query
     * @param int $page
     * @param int $limit
     * @param array $options
     * @return \Knp\Component\Pager\Pagination\PaginationInterface
     */
    public function paginate($query): array
    {
        if (false === $this->paginator instanceof \Knp\Component\Pager\PaginatorInterface) {
            throw new InvalidArgument('Please provide an intance of PaginatorInterface');
        }

        $paginatedData = $this->paginator->paginate($query, $page, $limit, $options);

        return [
            'data' => $paginatedData->getItems(),
            'page' => $page,
            'itemsPerPage' => $paginatedData->getItemNumberPerPage(),
            'total' => $paginatedData->getTotalItemCount(),
            'totalPages' => ceil($paginatedData->getTotalItemCount()/$paginatedData->getItemNumberPerPage())
        ];

    }

    /**
     *
     * @return
     */
    public function getContainer()
    {
        return $this->getKernel()->getContainer();
    }

    /**
     * @return \AppKernel
     */
    public function getKernel()
    {
        return \AppKernel::getInstance();
    }

    /**
     * @param $content
     * @param string $format
     * @return mixed
     */
    protected function serialize($content, $format = 'json')
    {

        try {
            $entity = $this->serializer
                ->serialize(
                    $content,
                    $format
                );

        } catch (\RuntimeException $ex) {
            throw new HttpException(400, $ex->getMessage());
        }

        return $entity;
    }

    /**
     * @param $entityClass
     * @param Request $request
     * @param string $format
     * @return mixed
     */
    protected function deserialize($entityClass, Request $request, $format = 'json')
    {

        try {
            $entity = $this->serializer
                ->deserialize(
                    $request->getContent(),
                    $entityClass,
                    $format
                );

        } catch (\RuntimeException $ex) {
            throw new HttpException(400, $ex->getMessage());
        }


        if (count($errors = $this->validator->validate($entity))) {
            return $errors;
        }

        return $entity;
    }
}