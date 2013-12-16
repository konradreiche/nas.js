root = exports ? this

class Bullet

  UNIT = 10

  TRANSITIONS =
    left:  {x: -UNIT, y:     0},
    right: {x:  UNIT, y:     0},
    down:  {x:     0, y:  UNIT},
    up:    {x:     0, y: -UNIT}

  SCRIPT = ['right', 'up', 'up', 'left', 'down', 'down']

  constructor: (@x, @y, @numBullets, @circle) ->
    @position = {x: UNIT * @x + 5, y: UNIT * @y + 1}
    x = @position.x
    y = @position.y

    @div = $("<div>").addClass("bullet")
      .css({transform: "translate(#{x}px,#{y}px)"})

    @circle.append(@div)

  setNext: (@next, @iteration) ->

  step: (coordinates) ->
    @position =
      x: @position.x + coordinates.x,
      y: @position.y + coordinates.y

  animate: =>
    direction = SCRIPT[@iteration]
    transition = TRANSITIONS[direction]

    @step(transition)
    @div.transition(@position, @next.animate)

    @iteration = (@iteration + 1) % @numBullets

class Nas

  constructor: (selector) ->
    @circle = $("<div>").addClass("circle")
    @bullets = []
    numBullets = 6
    numTransitions = 6

    @bullets.push(new Bullet(1, 3, numBullets, @circle))
    @bullets.push(new Bullet(1, 2, numBullets, @circle))
    @bullets.push(new Bullet(1, 1, numBullets, @circle))
    @bullets.push(new Bullet(2, 1, numBullets, @circle))
    @bullets.push(new Bullet(2, 2, numBullets, @circle))

    for bullet, i in @bullets
      iteration = [0, 5, 4, 3, 2][i]
      if i == @bullets.length - 1
        bullet.setNext(@bullets[0], iteration)
      else
        bullet.setNext(@bullets[i + 1], iteration)

    nas = $("<div>").addClass("nas")
    nas.append(@circle)
    $(selector).append(nas)

  start: ->
    $(".nas").css("visibility", "visible")
    @bullets[0].animate()
  
  stop: ->
    $(".nas").css("visibility", "hidden")

root.Nas = Nas
