<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\AnnoncesRepository;

class DetailProductController extends AbstractController
{
    #[Route('/annonce/detail/{id_annonce}', name: 'app_detail_product')]
    public function index(int $id_annonce, AnnoncesRepository $repo): Response
    {
        $annonceSelected = $repo->find($id_annonce);
        return $this->render('detail_product/detailProduct.html.twig', [
            'annonceSelected' => $annonceSelected,
        ]);
    }
}
