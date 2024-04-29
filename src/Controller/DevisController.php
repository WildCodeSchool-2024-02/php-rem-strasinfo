<?php

namespace App\Controller;

use App\Controller\AbstractController;
use App\Model\DevisManager;
use App\Model\ServiceManager;

class DevisController extends AbstractController
{
    public function add(): string
    {
        if (!$this->user) {
            $securityController = new SecurityController();
            return $securityController->login();
        }

        $model = new ServiceManager();
        $services = $model->selectAll();
        $servicesId = $model->selectId();
        $errors = [];
        if (!empty($_POST)) {
            $devis = array_map('trim', $_POST);

            if (empty($devis['laptop'])) {
                $errors['laptop'] = 'Vous devez renseignez la marque de votre ordinateur';
            }
            if (!in_array($devis['service'], array_keys($servicesId))) {
                $errors['service'] = 'Veuillez sélectionnez un service';
            }

            if (empty($errors)) {
                $modelDevis = new DevisManager();
                $modelDevis->insert($devis, $_SESSION['user_id']);
                header('Location: /');
            }
        }

        return $this->twig->render('Service/devis.html.twig', [
            'services' => $services,
            'errors' => $errors
        ]);
    }
}
