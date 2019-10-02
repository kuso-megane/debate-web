class Opinion < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  enum position: { agree: 'agree', disagree: 'disagree', neutral: 'neutral' }
  enum opinion_type: { exist: 'exist', nothing: 'nothing' }
end