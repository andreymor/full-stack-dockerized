<?php

namespace Api\Model\Entity;

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;
use JMS\Serializer\Annotation as Serializer;


/**
 * UF
 * @Serializer\ExclusionPolicy("all")
 * @ORM\Table(name="location")
 * @ORM\Entity(repositoryClass="Api\Model\Repository\LocationRepository")
 */
class Location
{
    /**
     * @var int
     *
     * @Serializer\Expose
     * @ORM\Column(name="id_location", type="integer")
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="sq_location", initialValue=1, allocationSize=100)
     * @ORM\Id
     */
    protected $id;

    /**
     *
     * @Serializer\Expose
     * @ORM\Column(name="name", type="string", length=50)
     */
    private $name;

    /**
     *
     * @Serializer\Expose
     * @ORM\Column(name="initials", type="string", length=5)
     */
    private $initials;

    /**
     *
     * @Serializer\Expose
     * @ORM\Column(name="code", type="string", length=3)
     */
    private $code;

    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * @param int $id
     */
    public function setId(int $id)
    {
        $this->id = $id;
    }

    /**
     * @return mixed
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param mixed $name
     */
    public function setName($name)
    {
        $this->name = $name;
    }

    /**
     * @return mixed
     */
    public function getInitials()
    {
        return $this->initials;
    }

    /**
     * @param mixed $initials
     */
    public function setInitials($initials)
    {
        $this->initials = $initials;
    }

    /**
     * @return mixed
     */
    public function getCode()
    {
        return $this->code;
    }

    /**
     * @param mixed $code
     */
    public function setCode($code)
    {
        $this->code = $code;
    }
}
