require File.expand_path(File.dirname(__FILE__) + '/neo')

# Greed is a dice game where you roll up to five dice to accumulate
# points.  The following "score" function will be used to calculate the
# score of a single roll of the dice.
#
# A greed roll is scored as follows:
#
# * A set of three ones is 1000 points
#
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
#
# * A one (that is not part of a set of three) is worth 100 points.
#
# * A five (that is not part of a set of three) is worth 50 points.
#
# * Everything else is worth 0 points.
#
#
# Examples:
#
# score([1,1,1,5,1]) => 1150 points
# score([2,3,4,6,2]) => 0 points
# score([3,4,5,3,3]) => 350 points
# score([1,5,1,2,4]) => 250 points
#
# More scoring examples are given in the tests below:
#
# Your goal is to write the score method.

def score(dice)
  # You need to write this method
  points = 0

  if dice.empty?
    points = 0
    return points
  else
    # a, b, c, d, e = dice.sort
    ones = []
    twos = []
    threes = []
    fours = []
    fives = []
    sixes = []

    dice.each do |die|
      # puts "inside dice.each loop"
      if die == 1
        ones << 1
        # puts "put a 1 into ones"
      elsif die == 2
        twos << 2
      elsif die == 3
        threes << 3
      elsif die == 4
        fours << 4
      elsif die == 5
        fives << 5
        # puts "put a 5 into fives"
      elsif die == 6
        sixes << 6
      end
    end

      #ONES
      if ones.size != 0
        if ones.size >= 3
          points += 1000

          3.times do
            ones.pop
          end

          if ones.size != 0
            ones.each do |one|
              points += 100
            end
          end
          
        else
          ones.each do |one|
            points += 100
          end
        end
      end

      #TWOS
      if twos.size != 0
        if twos.size == 3
          points += 200
        end
      end

      #THREES
      if threes.size != 0
        if threes.size == 3
          points += 300
        end
      end

      #FOURS
      if fours.size != 0
        if fours.size == 3
          points += 400
        end
      end

      #FIVES
      if fives.size != 0
        # puts "fives is NOT empty"
        if fives.size >= 3
          # puts "there are 3 fives"
          points += 500

          3.times do
            fives.pop
          end

          if fives.size != 0
            fives.each do |five|
              points += 50
            end
          end
        else
          # puts "fives.size is NOT 3..."
          fives.each do |five|
            points += 50
            # puts "added 50 points"
          end
        end
      end

      #SIX
      if sixes.size != 0
        if sixes.size == 3
          points += 600
        end
      end







      # if die != 1
      #   puts "not a 1 or a 5"
      #   if die == 2
      #     points += 200
      #   elsif die == 3
      #     points += 300
      #   elsif die == 4
      #     points += 400
      #   elsif die == 5
      #     points += 500
      #   end
      # end



    # if dice.include?(5)
    #   fives = []
    #   dice.each do |die|
    #     if die == 5
    #       fives << 5
    #       #puts "Pushed a 5 into fives array"
    #     end
    #   end
    #
    #   if fives.size != 3
    #     fives.each do |five|
    #       points += 50
    #       #puts "We are adding points (fives)! total: #{points}"
    #       #puts "This is the fives array: #{fives}"
    #     end
    #   elsif fives.size == 3
    #     points += 500
    #   end
    # end
    #
    # if dice.include?(1)
    #   ones = []
    #   dice.each do |die|
    #     if die == 1
    #       ones << 1
    #       # puts "Pushed a 1 into ones array"
    #     end
    #   end
    #   if ones.size != 3
    #     ones.each do |one|
    #       points += 100
    #       # puts "We are adding points (ones)! total: #{points}"
    #       # puts "This is the ones array: #{ones}"
    #     end
    #   elsif ones.size == 3
    #     points += 1000
    #   end
    # end

    return points
  end
end

class AboutScoringProject < Neo::Koan
  def test_score_of_an_empty_list_is_zero
    assert_equal 0, score([])
  end

  def test_score_of_a_single_roll_of_5_is_50
    assert_equal 50, score([5])
  end

  def test_score_of_a_single_roll_of_1_is_100
    assert_equal 100, score([1])
  end

  def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores
    assert_equal 300, score([1,5,5,1])
  end

  def test_score_of_single_2s_3s_4s_and_6s_are_zero
    assert_equal 0, score([2,3,4,6])
  end

  def test_score_of_a_triple_1_is_1000
    assert_equal 1000, score([1,1,1])
  end

  def test_score_of_other_triples_is_100x
    assert_equal 200, score([2,2,2])
    assert_equal 300, score([3,3,3])
    assert_equal 400, score([4,4,4])
    assert_equal 500, score([5,5,5])
    assert_equal 600, score([6,6,6])
  end

  def test_score_of_mixed_is_sum
    assert_equal 250, score([2,5,2,2,3])
    assert_equal 550, score([5,5,5,5])
    assert_equal 1100, score([1,1,1,1])
    assert_equal 1200, score([1,1,1,1,1])
    assert_equal 1150, score([1,1,1,5,1])
  end

end
