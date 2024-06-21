class Uav < ApplicationRecord
  belongs_to :user
  has_many :panel_solar
  has_many :estacion_carga_ac
  has_many :estacion_carga_dc
  has_many :datos_uav

  enum tipo_dron: { multirotor: 0, ala_fija: 1 }
  enum tipo_placa: { arduino: 0, berrypi: 1 }
end
