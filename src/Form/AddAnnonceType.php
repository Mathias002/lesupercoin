<?php

namespace App\Form;

use App\Entity\Annonces;
use App\Entity\Categories;
use Doctrine\ORM\EntityRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AddAnnonceType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title')
            ->add('prix')
            ->add('content')
            ->add('categories', EntityType::class, [
                'class' => Categories::class,
                'choice_label' => 'libelle', // Remplacez 'libelle' par le nom de la propriété que vous souhaitez utiliser comme libellé
                'query_builder' => function (EntityRepository $er) {
                    return $er->createQueryBuilder('c')
                        ->orderBy('c.libelle', 'DESC'); // Vous pouvez ajuster l'ordre selon vos besoins
                },
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Annonces::class,
        ]);
    }
}
