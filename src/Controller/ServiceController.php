<?php

namespace App\Controller;

use App\Controller\AbstractController;
use App\Model\ServiceManager;

class ServiceController extends AbstractController
{
    public function index(): string
    {
        $model = new ServiceManager();
        $services = $model->selectAll();

        return $this->twig->render('Service/index.html.twig', [
            'services' => $services
        ]);
    }
}
