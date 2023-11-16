<?php

namespace App\Controller;

use App\Entity\Annonces;
use App\Form\UpdateAnnonceType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;

class UpdateAnnonceController extends AbstractController
{
    #[Route('/annonce/update/{id_annonce}', name: 'annonce_update')]
    public function update(Request $request, EntityManagerInterface $entityManager, int $id_annonce): Response
    {
        $annonce = $entityManager->getRepository(Annonces::class)->find($id_annonce);
        $annonce->setUpdatedat(new \DateTime());

        $form = $this->createForm(UpdateAnnonceType::class, $annonce);
        $form->handleRequest($request);

        if (!$annonce) {
            throw $this->createNotFoundException(
                'No annonce found for id ' . $id_annonce
            );
        }

        if ($form->isSubmitted() && $form->isValid()) {

            // Utilisez l'EntityManager pour persister l'utilisateur
            $entityManager->flush();

            // Faites tout ce que vous devez faire après l'ajout

            return $this->redirectToRoute('app_all_product');
        }

        return $this->render('update_annonce/update_annonce_form.html.twig', [
            'UpdateAnnonceForm' => $form->createView(),
            'SelectedAnnonce' => $annonce,
        ]);
    }
}
