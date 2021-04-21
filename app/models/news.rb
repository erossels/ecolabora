class News < ApplicationRecord
  belongs_to :admin
  has_one_attached :photo

  validates :name, presence: { message: "La noticia debe llevar un título" }
  validates :content, presence: { message: "El contenido no puede estar vacío" }

end
