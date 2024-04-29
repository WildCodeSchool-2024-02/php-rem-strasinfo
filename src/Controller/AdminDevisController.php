<?php

namespace App\Controller;

use App\Controller\AbstractController;
use App\Model\DevisManager;

class AdminDevisController extends AbstractController
{
    public function index(): string
    {
        $model = new DevisManager();
        $devis = $model->selectDevis();

        return $this->twig->render('Admin/Devis/index.html.twig', [
            'devis' => $devis
        ]);
    }
}
