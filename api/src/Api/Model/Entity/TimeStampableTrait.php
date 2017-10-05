<?php


namespace Api\Model\Entity;


use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;
use JMS\Serializer\Annotation as Serializer;
use Datasus\Core\BaseBundle\Entity\AbstractBase;
use Datasus\Core\BaseBundle\Doctrine\ORM\Mapping\Annotation as Datasus;
use Symfony\Component\Validator\Constraints\DateTime;

trait TimeStampableTrait
{
    /**
     *
     * @Serializer\Expose
     * @Serializer\Type("DateTime")
     * @Gedmo\Timestampable(on="create")
     * @ORM\Column(name="created_at", type="datetime")
     */
    private $createdAt;

    /**
     *
     * @Serializer\Expose
     * @Serializer\Type("DateTime")
     * @ORM\Column(name="removed_at", type="datetime", nullable=true)
     */
    private $removedAt;

    /**
     * @return mixed
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    /**
     * @param mixed $createdAt
     */
    public function setCreatedAt($createdAt)
    {
        $this->createdAt = $createdAt;
    }

    /**
     * @return mixed
     */
    public function getRemovedAt()
    {
        return $this->removedAt;
    }

    /**
     * @param mixed $removedAt
     */
    public function setRemovedAt($removedAt)
    {
        $this->removedAt = $removedAt;
    }
}