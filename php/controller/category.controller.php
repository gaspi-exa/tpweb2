<?php

require_once 'php/model/category.model.php';

class CategoryController
{
    private $category;
    private $model;

    public function __construct()
    {
        $this->model = new CategoryModel();
        $this->setCategories($this->model->getCategories());
    }

    public function setCategories($categories)
    {
        $this->category = $categories;
    }

    public function getCategories()
    {
        return $this->category;
    }
}
