# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
    SELECT
      DISTINCT original.yr
    FROM
      nobels AS original
    LEFT OUTER JOIN
      (
      SELECT yr, COUNT(*) AS has_chemistry
      FROM nobels
      WHERE nobels.subject = 'Chemistry'
      GROUP BY yr
      ) AS chemistry_winners ON original.yr = chemistry_winners.yr
    WHERE chemistry_winners.has_chemistry IS NULL AND original.subject = 'Physics'
  SQL
end
