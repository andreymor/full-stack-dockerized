<?php
namespace App\CoreBundle\Command;

use Sensio\Bundle\GeneratorBundle\Command\Helper\QuestionHelper;
use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\ArrayInput;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;

class CreateApiResourceCommand extends ContainerAwareCommand
{

    protected function getDialogHelper()
    {
        $dialog = $this->getHelperSet()->get('question');
        if (!$dialog || get_class($dialog) !== 'Sensio\Bundle\GeneratorBundle\Command\Helper\QuestionHelper') {
            $this->getHelperSet()->set($dialog = new QuestionHelper());
        }

        return $dialog;
    }

    protected function configure()
    {
        $this
            ->setName('app:create:api-resource')
            ->setDescription('Cria um fluxo de REST a partir de um controller')
            ->addArgument('ObjectName', InputArgument::REQUIRED, 'Nome do objeto a ser criado - Usuario, por exemplo')
            ->addArgument('BundleNamespace', InputArgument::REQUIRED, 'Namespace do Bundle de destino - utilizar \\')
            ->addArgument('ModelNamespace', InputArgument::REQUIRED, 'Namespace dos Models - utilizar \\')
            ->addOption('service-name', null, InputOption::VALUE_OPTIONAL, 'Utiliza o serviço informado e não cria um novo');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $dialog = $this->getDialogHelper();

        //Namespace do Bundle a ser criado
        $bundleNamespace = $input->getArgument('BundleNamespace');
        $modelNamespace = $input->getArgument('ModelNamespace');

        /**
         * Controles de namespace
         */
        $bundleNamespaceCamelized = str_replace("\\", "", $bundleNamespace);
        $modelNamespaceCamelized = str_replace("\\", "", $modelNamespace);
        $bundleNamespaceDasherized = strtolower(str_replace("\\", "_", $bundleNamespace));
        $bundleNamespaceArray = array();
        if(false !== strpos($bundleNamespace, "\\")) {
            $bundleNamespaceArray = explode("\\", $bundleNamespace);
        }

        //Nome do controle a ser criado
        $objectName = $input->getArgument('ObjectName');
        $objectCamelArray = preg_split('/(?=[A-Z])/',$objectName);
        array_shift($objectCamelArray);
        $objectNamePluralized = $objectCamelArray[0] . 's';
        $objectNameDasherized = strtolower(implode('_', $objectCamelArray));;

        $hasService = $input->getOption('service-name');
        /**
         * Service name
         */
        $serviceName =  ($hasService) ? $hasService : strtolower($bundleNamespaceArray[0]) .
            "." . strtolower($bundleNamespaceArray[1]) .
            ".service." . $objectNameDasherized;

        $exceptionName =  $objectName;

        if($hasService) {
            $serviceNameExplode = explode(".", $serviceName);
            $newName = explode("_", end($serviceNameExplode));
            $exceptionName = implode(array_map('ucfirst', $newName), '');
        }

        //Locais
        $ds = DIRECTORY_SEPARATOR;

        $appDir = str_replace(
            $this->getContainer()->get('kernel')->getName(),
            '',
            $this->getContainer()->get('kernel')->getRootDir()
        );

        /**
         * Diretórios
         */
        $appDir = str_replace('\\',$ds,str_replace('/',$ds,$appDir));
        $srcDir = $appDir.'src';
        $bundleDir = $srcDir.$ds.str_replace(['\\', '/'],$ds, $bundleNamespace).$ds;
        //$baseDir = $appDir.'vendor'.$ds.'datasus'.$ds.'base-bundle'.$ds.'Datasus'.$ds.'Core'.$ds.'BaseBundle'.$ds.'Resources'.$ds.'templates';
        $baseDir = $appDir.'src'.$ds.'App'.$ds.'CoreBundle'.$ds.'Resources'.$ds.'templates';
        $resourceConfigDir = $bundleDir."Resources".$ds."config".$ds;

        /**
         * Templates
         */
        $baseObjectFile = $baseDir.$ds.'ControllerTemplateREST.txt';
        $baseExceptionFile = $baseDir.$ds.'ExceptionTemplateREST.txt';
        $baseServiceFile = $baseDir.$ds.'ServiceTemplateREST.txt';

        /**
         * TEMPLATE DE CONTROLE
         */
        $output->writeln("\n\n- Gerando o controle => " . $objectName.'Controller.php');

        if(file_exists($bundleDir."Controller".$ds.$objectName.'Controller.php')) {
            $output->writeln("\n\n- O controle ja existe e nao foi alterado.");
        }
        else {

            $objectContent = file_get_contents($baseObjectFile);
            $campos   = array("##bundleNamespace##", "##objectName##", "##serviceName##", "##objectNamePluralized##", "##exceptionName##");
            $toReplace = array($bundleNamespace, $objectName, $serviceName, $objectNamePluralized, $exceptionName);
            $novoConteudo = str_replace($campos, $toReplace, $objectContent);

            $handler = fopen($bundleDir."Controller".$ds.$objectName.'Controller.php', 'w');
            fwrite($handler, $novoConteudo);
            fclose($handler);
        }



        /**
         * Atualização de rotas
         */
        $output->writeln("\n\n- Atualizando as rotas REST");
        $routeContent = sprintf("\n%s:\n", $objectNameDasherized);
        $routeContent .= sprintf("    type: %s\n", "rest");
        $routeContent .= sprintf("    name_prefix: %s\n", strtolower($bundleNamespaceArray[0]."_".$bundleNamespaceArray[1]. "_" . $objectNameDasherized . "_api_v1_"));
        $routeContent .= sprintf("    resource: %s\\Controller\\%s\n", $bundleNamespace, $objectName."Controller");
        $routeContent .= "\n";


        if(file_exists($resourceConfigDir."rest_routing.yml")) {

            $routeFile = file_get_contents($resourceConfigDir."rest_routing.yml");

            if (false !== strpos($routeFile, $routeContent)) {
                $output->writeln("\n\n- A rota REST para o objeto " . $objectName . " ja existe");
            }
            else {
                $routeContent = $routeFile.$routeContent;
                file_put_contents($resourceConfigDir."rest_routing.yml", $routeContent);
            }
        }
        else {
            $handler = fopen($resourceConfigDir."rest_routing.yml", 'w');
            fwrite($handler, $routeContent);
            fclose($handler);
        }


        /**
         * TEMPLATE DE SERVICO
         */

        if(!$hasService) {

            $output->writeln("\n\n- Gerando o servico => " . $objectName.'Service.php');

            $serviceContent = file_get_contents($baseServiceFile);
            $campos   = array("##bundleNamespace##", "##objectName##", "##serviceName##", "##bundleNamespaceCamelized##", "##objectNamePluralized##", "##exceptionName##", "##modelNamespace##", "##modelNamespaceCamelized##");
            $toReplace = array($bundleNamespace, $objectName, $serviceName, $bundleNamespaceCamelized, $objectNamePluralized, $exceptionName, $modelNamespace, $modelNamespaceCamelized);
            $novoConteudo = str_replace($campos, $toReplace, $serviceContent);

            $handler = fopen($bundleDir."Service".$ds.$objectName.'Service.php', 'w');
            fwrite($handler, $novoConteudo);
            fclose($handler);

            /**
             * TEMPLATE DE EXCEPTION
             */
            $output->writeln("\n\n- Gerando a exception => " . $objectName.'Exception.php');

            $exceptionContent = file_get_contents($baseExceptionFile);
            $campos   = array("##bundleNamespace##", "##objectName##", "##serviceName##", "##objectNamePluralized##");
            $toReplace = array($bundleNamespace, $objectName, $serviceName, $objectNamePluralized);
            $novoConteudo = str_replace($campos, $toReplace, $exceptionContent);

            $handler = fopen($bundleDir."Service".$ds."Exception".$ds.$objectName.'Exception.php', 'w');
            fwrite($handler, $novoConteudo);
            fclose($handler);


            $serviceContent = sprintf("\n    %s:\n", $serviceName);
            $serviceContent .= sprintf("        class: %s\\Service\\%s\n", $bundleNamespace, $objectName."Service");
            $serviceContent .= sprintf("        arguments: %s\n", "[\"@doctrine.orm.entity_manager\", \"@jms_serializer\", \"@validator\", \"@knp_paginator\"]");
            $serviceContent .= "\n";

            $output->writeln("\n\n- Atualizando a configuracao de services");
            if(file_exists($resourceConfigDir."services.yml")) {
                $serviceFile = file_get_contents($resourceConfigDir."services.yml");

                if (false !== strpos($serviceFile, $serviceContent)) {
                    $output->writeln("\n\n- O servico para o objeto " . $objectName . " ja esta configurado");
                }
                else {
                    $serviceContent = $serviceFile.$serviceContent;
                    file_put_contents($resourceConfigDir."services.yml", $serviceContent);
                }

            }
            else {
                $handler = fopen($resourceConfigDir."services.yml", 'w');
                fwrite($handler, $serviceContent);
                fclose($handler);
            }
        }

    }

}