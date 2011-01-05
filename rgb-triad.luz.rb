 ###############################################################################
 #  Camo wrote this. I hope you have a nice day.
 ###############################################################################

class ActorEffectRGBTriad < ActorEffect
	title				"RGB Triad"
	description "Splits an actor into a red, green, and blue actor, arranged triangularly."

	setting 'distance', :float, :default => 0.0..1.0
	setting 'angle', :float, :default => 0.0..1.0

	def render
		return yield if distance == 0.0

		with_angle_slide(angle, distance) {
			with_color([1.0, 0.0, 0.0]) {
				yield :child_index => 0, :total_children => 3
			}
		}
		with_angle_slide(angle + 0.333, distance) {
            with_color([0.0, 1.0, 0.0]) {
                yield :child_index => 1, :total_children => 3
            }
		}
		with_angle_slide(angle + 0.666, distance) {
			with_color([0.0, 0.0, 1.0]) {
				yield :child_index => 2, :total_children => 3
			}
		}
	end
end
