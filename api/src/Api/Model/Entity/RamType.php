<?php

namespace Api\Model\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * RamType
 *
 * @ORM\Table(name="ram_type")
 * @ORM\Entity
 */
class RamType
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id_ram_type", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="sq_ram_type", initialValue=1, allocationSize=100)
     */
    protected $id;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="string", length=6)
     */
    private $description;

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
    public function getDescription(): string
    {
        return $this->description;
    }

    /**
     * @param string $description
     */
    public function setDescription(string $description)
    {
        $this->description = $description;
    }

}

