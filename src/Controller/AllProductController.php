<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\AnnoncesRepository;

class AllProductController extends AbstractController
{
    #[Route('/', name: 'app_all_product')]
    public function index(AnnoncesRepository $repo): Response
    {

        $liste = $repo->findAll();

        return $this->render('all_product/allProduct.html.twig', [
            'annonces' => $liste,
        ]);
    }
}
