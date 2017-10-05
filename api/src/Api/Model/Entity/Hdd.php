<?php

namespace Api\Model\Entity;

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;
use JMS\Serializer\Annotation as Serializer;

/**
 * Ram
 *
 * @Serializer\ExclusionPolicy("all")
 * @ORM\Table(name="hdd")
 * @ORM\Entity(repositoryClass="Api\Model\Repository\HddRepository")
 */
class Hdd
{

    use TimeStampableTrait;

    /**
     * @var integer
     *
     * @Serializer\Expose
     * @ORM\Column(name="id_hdd", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="sq_hdd", initialValue=1, allocationSize=100)
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
     * @var string
     *
     * @Serializer\Expose
     * @ORM\Column(name="size_type", type="string", length=2)
     */
    private $sizeType;

    /**
     * @var HddType
     *
     *
     * @Serializer\Expose
     * @Serializer\Type("Api\Model\Entity\HddType")
     * @ORM\ManyToOne(targetEntity="Api\Model\Entity\HddType")
     * @ORM\JoinColumn(name="fk_hdd_type", referencedColumnName="id_hdd_type")
     */
    protected $hddType;

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
    public function getHddType(): HddType
    {
        return $this->hddType;
    }

    /**
     * @param RamType $hddType
     */
    public function setHddType(HddType $hddType)
    {
        $this->hddType = $hddType;
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

