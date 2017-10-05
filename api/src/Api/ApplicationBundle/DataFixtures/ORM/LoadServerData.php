<?php

namespace Api\ApplicationBundle\DataFixtures\ORM;

use Api\Model\Entity\Hdd;
use Api\Model\Entity\HddType;
use Api\Model\Entity\Location;
use Api\Model\Entity\Pais;
use Api\Model\Entity\Ram;
use Api\Model\Entity\RamType;
use Api\Model\Entity\Server;
use Api\Model\Entity\Uf;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Api\Model\Entity\Curso;
use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;

class LoadServerData extends AbstractFixture implements OrderedFixtureInterface, ContainerAwareInterface
{
    /**
     * @var ContainerInterface
     */
    private $container;

    /**
     * @param ContainerInterface|null $container
     */
    public function setContainer(ContainerInterface $container = null)
    {
        $this->container = $container;
    }

    public function load(ObjectManager $manager)
    {

        $dir       = $this->container->getParameter("kernel.root_dir") . "/Resources/media";
        $file_name = "servers_filters_assignment.xlsx";
        $excel = $this->container->get('phpexcel')->createPHPExcelObject($dir . DIRECTORY_SEPARATOR . $file_name);
        $sheet = $excel->getActiveSheet();
        $highestRow = $sheet->getHighestRow();
        $highestColumn = $sheet->getHighestColumn();


        $locations = $models = $ramTypes = $hddTypes = $servers = $hdds = $rams = [];

        for ($row = 2; $row <= $highestRow; $row++) {
            $rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row,
                null, true, false);

            foreach($rowData as $line) {

                $ramType = substr($line[1], -4);
                $hddType = explode('B', $line[2])[1];

                $locationData = explode('-', $line[3]);
                $locationInitials = substr($locationData[0], -3);
                $locationName = str_replace($locationInitials, '', $locationData[0]);

                $ramTypes[$ramType] = $ramType;
                $hddTypes[$hddType] = $hddType;

                $locations[$line[3]] = [
                    'name' => $locationName,
                    'initials' => $locationInitials,
                    'code' => $locationData[1]
                ];

                $sizeType = substr(explode('S', explode('x', $line[2])[1])[0], -2);
                $ramSizeType = explode('GB', $line[1]);

                $size = (int) str_replace($sizeType, '', explode('S', explode('x', $line[2])[1])[0]);

                $multi = ($sizeType == 'TB') ? 1000 : 1;

                $hdds[explode('S', explode('x', $line[2])[1])[0]] = [
                    'type' => $hddType,
                    'size' => $size * $multi,
                    'sizeType' => $sizeType
                ];

                $rams[str_replace($ramType, '', $line[1])] = [
                    'type' => $ramSizeType[1],
                    'size' => $ramSizeType[0],
                    'sizeType' => 'GB'
                ];

                $modelName = preg_split('/\s+/', $line[0]);

                $modelType = array_slice($modelName, -2, 2, true);
                $model = implode(" ", array_diff($modelName, $modelType));

                $servers[] = [
                    'model' => $model,
                    'modelType' => implode(" ", $modelType),
                    'hddQt' => explode('x', $line[2])[0],
                    'hddSize' => $size * $multi,
                    'ramSize' => $ramSizeType[0],
                    'price' => $line[4],
                    'locationInitials' => $locationInitials
                ];
            }
        }


        foreach ($locations as $location) {
            $entity = new Location();
            $entity->setInitials($location['initials']);
            $entity->setCode($location['code']);
            $entity->setName($location['name']);
            $manager->persist($entity);
            $this->addReference('location_' . $location['initials'], $entity);
        }

        foreach ($ramTypes as $ramType) {
            $entity = new RamType();
            $entity->setDescription($ramType);
            $manager->persist($entity);
            $this->addReference('ramType_' . $ramType, $entity);
        }

        foreach ($hddTypes as $hddType) {
            $entity = new HddType();
            $entity->setDescription($hddType);
            $manager->persist($entity);
            $this->addReference('hddType_' . $hddType, $entity);
        }

        foreach($hdds as $hdd) {
            $type = $this->getReference('hddType_' . $hdd['type']);
            $entity = new Hdd();
            $entity->setSize($hdd['size']);
            $entity->setHddType($type);
            $entity->setSizeType($hdd['sizeType']);
            $manager->persist($entity);
            $this->addReference('hdd_' . $hdd['size'], $entity);
        }

        foreach($rams as $ram) {
            $type = $this->getReference('ramType_' . $ram['type']);
            $entity = new Ram();
            $entity->setSize($ram['size']);
            $entity->setRamType($type);
            $entity->setSizeType($ram['sizeType']);
            $manager->persist($entity);
            $this->addReference('ram_' . $ram['size'], $entity);
        }

        foreach($servers as $server) {
            $hdd = $this->getReference('hdd_' . $server['hddSize']);
            $ram = $this->getReference('ram_' . $server['ramSize']);
            $location = $this->getReference('location_' . $server['locationInitials']);
            $entity = new Server();
            $entity->setHdd($hdd);
            $entity->setRam($ram);
            $entity->setHddQuantity($server['hddQt']);
            $entity->setLocation($location);
            $entity->setPrice($server['price']);
            $entity->setModel($server['model']);
            $entity->setModelType($server['modelType']);
            $manager->persist($entity);

        }

        $manager->flush();
    }

    public function getOrder()
    {
        return 1;
    }
}