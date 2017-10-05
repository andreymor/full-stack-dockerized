<?php

namespace Api\Model\Entity;

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;
use JMS\Serializer\Annotation as Serializer;

/**
 * Ram
 *
 * @Serializer\ExclusionPolicy("all")
 * @ORM\Table(name="ram")
 * @ORM\Entity(repositoryClass="Api\Model\Repository\RamRepository")
 */
class Ram
{

    use TimeStampableTrait;

    /**
     * @var integer
     *
     * @Serializer\Expose
     * @ORM\Column(name="id_ram", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="sq_ram", initialValue=1, allocationSize=100)
     */
    protected $id;

    /**
     * @var string
     *
     * @Serializer\Expose
     * @ORM\Column(name="size", type="integer")
     */
    private $size;

    /**
     * @var RamType
     *
     *
     * @Serializer\Expose
     * @Serializer\Type("Api\Model\Entity\RamType")
     * @ORM\ManyToOne(targetEntity="Api\Model\Entity\RamType")
     * @ORM\JoinColumn(name="fk_ram_type", referencedColumnName="id_ram_type")
     */
    protected $ramType;

    /**
     * @var string
     *
     * @Serializer\Expose
     * @ORM\Column(name="size_type", type="string", length=2)
     */
    private $sizeType;

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
    public function getSize(): string
    {
        return $this->size;
    }

    /**
     * @param string $size
     */
    public function setSize(string $size)
    {
        $this->size = $size;
    }

    /**
     * @return RamType
     */
    public function getRamType(): RamType
    {
        return $this->ramType;
    }

    /**
     * @param RamType $ramType
     */
    public function setRamType(RamType $ramType)
    {
        $this->ramType = $ramType;
    }

    /**
     * @return string
     */
    public function getSizeType(): string
    {
        return $this->sizeType;
    }

    /**
     * @param string $sizeType
     */
    public function setSizeType(string $sizeType)
    {
        $this->sizeType = $sizeType;
    }

}

