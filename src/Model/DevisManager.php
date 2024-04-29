<?php

namespace App\Model;

use App\Model\AbstractManager;

class DevisManager extends AbstractManager
{
    public const TABLE = 'service_user';
    public const JOINTABLE = 'service';
    public const JOINTABLE2 = 'user';

    public function insert(array $devis, int $user)
    {
        $query = 'INSERT INTO ' . self::TABLE . ' (description, laptop, service_id, user_id) VALUES 
        (:description, :laptop, :service_id, :user_id)';
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':description', $devis['description']);
        $statement->bindValue(':laptop', $devis['laptop']);
        $statement->bindValue(':service_id', $devis['service'], \PDO::PARAM_INT);
        $statement->bindValue(':user_id', $user, \PDO::PARAM_INT);
        $statement->execute();

        return (int)$this->pdo->lastInsertId();
    }

    public function selectDevis(): array
    {
        $query = 'SELECT service_user.*, service.name, user.firstname, user.lastname, user.adresse, user.email 
        FROM service_user LEFT JOIN service ON service.id = service_user.service_id LEFT JOIN user ON 
        user.id = service_user.user_id';
        return $this->pdo->query($query)->fetchAll();
    }
}
