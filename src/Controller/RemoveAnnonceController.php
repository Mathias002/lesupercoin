<?php

namespace App\Controller;

use App\Entity\Annonces;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Routing\Annotation\Route;


class RemoveAnnonceController extends AbstractController
{
    #[Route('/annonce/remove/{id_annonce}', name: 'app_remove_annonce')]
    public function index(int $id_annonce, EntityManagerInterface $entityManager): Response
    {

        $annonce = $entityManager->getRepository(Annonces::class)->find($id_annonce);

        if (!$annonce) {
            throw $this->createNotFoundException(
                'No annonce found for id ' . $id_annonce
            );
        }

        $entityManager->remove($annonce);
        $entityManager->flush();

        return $this->redirectToRoute('app_all_product');
    }
}
