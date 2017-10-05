<?php

namespace Api\ApplicationBundle\Controller;


use Api\ApplicationBundle\Service\HddService;
use Api\ApplicationBundle\Service\HddTypeService;
use Api\ApplicationBundle\Service\LocationService;
use Api\ApplicationBundle\Service\RamService;
use Api\ApplicationBundle\Service\ServerService;
use App\CoreBundle\Controller\Controller;
use App\CoreBundle\Service\ServiceInterface;
use FOS\RestBundle\Controller\Annotations as Rest;
use Nelmio\ApiDocBundle\Annotation\Model;
use Swagger\Annotations as SWG;
use Api\ApplicationBundle\Service\Exception\ServerException;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RequestStack;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

/**
 * @Route(service="api.applicationbundle.controller.server")
 */
class ServerController extends Controller
{
    protected $locationService;

    protected $ramService;

    protected $hddService;

    protected $hddTypeService;

    public function __construct(
        ServerService $service,
        LocationService $locationService,
        RamService $ramService,
        HddService $hddService,
        HddTypeService $hddTypeService)
    {
        parent::__construct($service);

        $this->locationService = $locationService;
        $this->ramService = $ramService;
        $this->hddService = $hddService;
        $this->hddTypeService = $hddTypeService;
    }

    /**
     * @SWG\Response(
     *     response=200,
     *     description="Returns a single resource"
     * )
     * @SWG\Tag(name="parameters")
     * @param $id
     * @return mixed
     */
    public function getAction($id)
    {
        try {
            return $this->resolve($this->service->getServer($id));
        } catch (ServerException $ex) {
            return $this->reject($ex);
        }
    }

    /**
     * @SWG\Response(
     *     response=200,
     *     description="Returns a collection of resources"
     * )
     * @SWG\Tag(name="parameters")
     * @return mixed
     */
    public function cgetAction()
    {
        try {

            $locations = $this->locationService->all();
            $rams = $this->ramService->all();
            $hdds = $this->hddService->all();
            $hddType = $this->hddTypeService->all();
            $servers = $this->service->all();

            return $this->resolve(['list' => $servers, 'form' => compact("locations", "rams", "hdds", "hddType")]);

        } catch (ServerException $ex) {
            return $this->reject($ex);
        }
    }


    /**
     * @SWG\Response(
     *     response=200,
     *     description="Returns a collection of resources"
     * )
     * @SWG\Tag(name="parameters")
     * @param Request $request
     * @return \FOS\RestBundle\View\View
     */
    public function postAction(Request $request)
    {
        try {
            $this->service->save($request);
            return $this->resolve($this->get('translator')->trans('translate.nome'));
        } catch (ServerException $ex) {
            return $this->reject($ex);
        }
    }


    /**
     * @SWG\Response(
     *     response=200,
     *     description="Returns a collection of resources"
     * )
     * @SWG\Tag(name="parameters")
     * @param Request $request
     * @param         $id
     * @return \FOS\RestBundle\View\View
     */
    public function putAction(Request $request, $id)
    {
        try {
            $this->service->save($request);
            return $this->resolve($this->get('translator')->trans('translate.nome'));
        } catch (ServerException $ex) {
            return $this->reject($ex);
        }
    }

    /**
     * @SWG\Response(
     *     response=200,
     *     description="Returns a collection of resources"
     * )
     * @SWG\Tag(name="parameters")
     * @param $id
     * @return \FOS\RestBundle\View\View
     */
    public function deleteAction($id)
    {
        try {
            $this->service->delete($id);
            return $this->resolve($this->get('translator')->trans('translate.nome'));
        } catch (ServerException $ex) {
            return $this->reject($ex);
        }
    }
}
