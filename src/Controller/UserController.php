<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Form\UpdateUserType;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface; // N'oubliez pas d'importer l'EntityManagerInterface
use App\Entity\User; // Assurez-vous d'importer la classe User
use App\Repository\UserRepository;


class UserController extends AbstractController
{
    #[Route('/user/{id_user}', name: 'app_user')]
    public function show(int $id_user, EntityManagerInterface $entityManager): Response
    {
        // Récupérer les données de l'utilisateur depuis la base de données
        $user = $entityManager->getRepository(User::class)->findOneBy(['id' => $id_user]);

         // Récupérer l'utilisateur connecté
         $loggedInUser = $this->getUser();

        if (!$user) {
            return $this->render('user/user_not_found.html.twig', [
                'user' => $user,
            ]);
        }
        
        // getId() raison de l'erreur inconnu (cache ?) mais fonctionne quand même aucunne incidence sur le fonctionement du site 
        if ($loggedInUser && $loggedInUser->getId() == $id_user){ 
            return $this->render('user/user.html.twig', [
                'user' => $user,
            ]);
        }else{
            $this->addFlash('acces_denied',"Vous n'avez pas les droits nécessaires");
            return $this->redirectToRoute('app_all_product');
        }
        
    }

    #[Route('/users', name: 'app_all_user')]
    public function showall(UserRepository $repo): Response
    {

        $users = $repo->findAll();

        return $this->render('user/allUser.html.twig', [
            'users' => $users,
        ]);
    }


    #[Route('/user/remove/{id_user}', name: 'app_remove_user')]
    public function remove(int $id_user, EntityManagerInterface $entityManager): Response
    {

        $user = $entityManager->getRepository(User::class)->find($id_user);

        if (!$user) {
            throw $this->createNotFoundException(
                'No user found for id ' . $id_user
            );
        }

        $entityManager->remove($user);
        $entityManager->flush();

        return $this->redirectToRoute('app_all_product');
    }

    #[Route('user/update/{id_user}', name: 'app_update_user')]
    public function update(int $id_user, Request $request, EntityManagerInterface $entityManager): Response
    {

        $user = $entityManager->getRepository(User::class)->find($id_user);

        $form = $this->createForm(UpdateUserType::class, $user);
        $form->handleRequest($request);

        if (!$user) {
            return $this->redirectToRoute('user/user_not_found.html.twig');
        }

        if ($form->isSubmitted() && $form->isValid()) {

            // Utilisez l'EntityManager pour persister l'utilisateur
            $entityManager->flush();

            // Faites tout ce que vous devez faire après l'ajout

            return $this->redirectToRoute('app_user', ['id_user' => $id_user]);
        }
        return $this->render('user/user_update_form.html.twig', [
            'UpdateUserForm' => $form->createView(),
            'SelectedUser' => $user,
        ]);

    }
}


