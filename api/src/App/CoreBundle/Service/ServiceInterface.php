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

interface ServiceInterface
{
    public function paginate($query);
}