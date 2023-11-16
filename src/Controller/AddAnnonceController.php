<?php

namespace App\Controller;

use App\Entity\Annonces;
use App\Form\AddAnnonceType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;


class AddAnnonceController extends AbstractController
{
    #[Route('/annonce/add', name: 'app_add_annonce')]
    public function index(Request $request, entityManagerInterface $entityManager): Response
    {
        $annonce = new Annonces();
        $annonce->setCreatedat(new \DateTime());
        $annonce->setUpdatedat(new \DateTime());

        $form = $this->createForm(AddAnnonceType::class, $annonce);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
           
            // Utilisez l'EntityManager pour persister l'utilisateur
            $entityManager->persist($annonce);
            $entityManager->flush();

            $this->addFlash('success',"L'annonce à bien été ajoutée");

            // Faites tout ce que vous devez faire après l'ajout

            return $this->redirectToRoute('app_all_product');
        }

        return $this->render('add_annonce/add_annonce_form.html.twig', [
            'NewAnnonceForm' => $form->createView(),
        ]);
    }
}
