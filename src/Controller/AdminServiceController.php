<?php

namespace App\Controller;

use App\Controller\AbstractController;
use App\Model\ServiceManager;

class AdminServiceController extends AbstractController
{
    public function index(): string
    {
        $model = new ServiceManager();
        $services = $model->selectAll();

        return $this->twig->render('Admin/Service/index.html.twig', [
            'services' => $services
        ]);
    }
    public function new()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $serviceManager = new ServiceManager();
            $serviceManager->insert($_POST);
            header('Location: /admin/services');
        }

        return $this->twig->render('Admin/Service/new.html.twig');
    }

    public function edit(int $id)
    {
        $serviceManager = new ServiceManager();

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $serviceManager->update($_POST);
            header('Location: /admin/services');
        }

        $service = $serviceManager->selectOneById($id);

        return $this->twig->render('Admin/Service/edit.html.twig', ['service' => $service]);
    }

    public function delete(int $id)
    {
        $serviceManager = new ServiceManager();
        $serviceManager->delete($id);
        header('Location: /admin/services');
    }
}
