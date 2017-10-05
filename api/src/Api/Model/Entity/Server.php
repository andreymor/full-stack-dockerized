<?php

namespace Api\Model\Entity;

use Doctrine\ORM\Mapping as ORM;
use JMS\Serializer\Annotation as Serializer;

/**
 * Cliente
 *
 * @ORM\Table(name="server")
 * @ORM\Entity(repositoryClass="Api\Model\Repository\ServerRepository")
 */
class Server
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id_server", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="sq_server", initialValue=1, allocationSize=100)
     */
    protected $id;

    /**
     * @var string
     *
     * @Serializer\Expose
     * @ORM\Column(name="model", type="string", length=500)
     */
    protected $model;

    /**
     * @var RamType
     *
     *
     * @Serializer\Expose
     * @Serializer\Type("Api\Model\Entity\Ram")
     * @ORM\ManyToOne(targetEntity="Api\Model\Entity\Ram")
     * @ORM\JoinColumn(name="fk_ram", referencedColumnName="id_ram")
     */
    protected $ram;

    /**
     * @var Hdd
     *
     *
     * @Serializer\Expose
     * @Serializer\Type("Api\Model\Entity\Hdd")
     * @ORM\ManyToOne(targetEntity="Api\Model\Entity\Hdd")
     * @ORM\JoinColumn(name="fk_hdd", referencedColumnName="id_hdd")
     */
    protected $hdd;

    /**
     * @var RamType
     *
     *
     * @Serializer\Expose
     * @Serializer\Type("Api\Model\Entity\Location")
     * @ORM\ManyToOne(targetEntity="Api\Model\Entity\Location")
     * @ORM\JoinColumn(name="fk_location", referencedColumnName="id_location")
     */
    protected $location;

    /**
     * @var integer
     *
     * @Serializer\Expose
     * @ORM\Column(name="hdd_quantity", type="integer")
     */
    protected $hddQuantity;

    /**
     * @var string
     *
     * @Serializer\Expose
     * @ORM\Column(name="price", type="string", length=10)
     */
    protected $price;

    /**
     * @var string
     *
     * @Serializer\Expose
     * @ORM\Column(name="model_type", type="string", length=30)
     */
    protected $modelType;

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
     * @return string
     */
    public function getModel(): string
    {
        return $this->model;
    }

    /**
     * @param string $model
     */
    public function setModel(string $model)
    {
        $this->model = $model;
    }

    /**
     * @return RamType
     */
    public function getRam(): Ram
    {
        return $this->ram;
    }

    /**
     * @param RamType $ram
     */
    public function setRam(Ram $ram)
    {
        $this->ram = $ram;
    }

    /**
     * @return RamType
     */
    public function getHdd(): Hdd
    {
        return $this->hdd;
    }

    /**
     * @param RamType $hdd
     */
    public function setHdd(Hdd $hdd)
    {
        $this->hdd = $hdd;
    }

    /**
     * @return RamType
     */
    public function getLocation(): Location
    {
        return $this->location;
    }

    /**
     * @param RamType $location
     */
    public function setLocation(Location $location)
    {
        $this->location = $location;
    }

    /**
     * @return int
     */
    public function getHddQuantity(): int
    {
        return $this->hddQuantity;
    }

    /**
     * @param int $hddQuantity
     */
    public function setHddQuantity(int $hddQuantity)
    {
        $this->hddQuantity = $hddQuantity;
    }

    /**
     * @return string
     */
    public function getPrice(): string
    {
        return $this->price;
    }

    /**
     * @param string $price
     */
    public function setPrice(string $price)
    {
        $this->price = $price;
    }

    /**
     * @return string
     */
    public function getModelType(): string
    {
        return $this->modelType;
    }

    /**
     * @param string $modelType
     */
    public function setModelType(string $modelType)
    {
        $this->modelType = $modelType;
    }
}

