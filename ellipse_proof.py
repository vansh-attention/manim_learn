from manim import * 

class SimpleIntro(Scene):
    def construct(self):
        # 1. Create a title
        title = Text("My Simple Manim Animation", font_size=48)
        self.play(Write(title))
        self.wait(1)
        self.play(title.animate.to_edge(UP)) # Move title to the top

        # 2. Create a circle
        circle = Circle(radius=1.5, color=BLUE, fill_opacity=0.5)
        circle.move_to(LEFT * 2.5) # Position it to the left

        self.play(Create(circle))
        self.wait(0.5)

        # 3. Write some text next to the circle
        circle_text = Text("This is a circle!", font_size=36)
        circle_text.next_to(circle, RIGHT, buff=0.5) # Position text to the right of the circle

        self.play(Write(circle_text))
        self.wait(1)

        # 4. Define a square (this is the target for the transformation)
        square = Square(side_length=2.5, color=GREEN, fill_opacity=0.5)
        square.move_to(LEFT * 2.5) # Keep it in the same initial position as the circle for a smooth transform

        # 5. Transform the circle into the square
        self.play(
            Transform(circle, square), # The 'circle' mobject becomes the 'square'
            FadeOut(circle_text)       # Fade out the old text
        )
        self.wait(0.5)

        # 6. Add new text for the square
        # Note: 'circle' now refers to the mobject that looks like a square
        square_text = Text("Now it's a square!", font_size=36)
        square_text.next_to(circle, RIGHT, buff=0.5)
        self.play(Write(square_text))
        self.wait(1)

        # 7. Animate the square (which is still referred to by the 'circle' variable)
        self.play(
            circle.animate.shift(UP * 2 + RIGHT * 5).set_color(RED).scale(0.7),
            square_text.animate.next_to(circle, RIGHT, buff=0.5) # Keep text next to the moving square
        )
        self.wait(1)

        # 8. Fade out everything
        self.play(
            FadeOut(title),
            FadeOut(circle),      # Fades out the (now red) square
            FadeOut(square_text)
        )
        self.wait(1)