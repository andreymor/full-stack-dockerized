<?php

namespace Api\Model\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * HddType
 *
 * @ORM\Table(name="hdd_type")
 * @ORM\Entity(repositoryClass="Api\Model\Repository\HddTypeRepository")
 */
class HddType
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id_hdd_type", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="sq_hdd_type", initialValue=1, allocationSize=100)
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

