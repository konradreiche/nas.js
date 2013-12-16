describe "Nas", ->

  it "appends a div-element to the target", ->
    nas = new Nas("body")
    result = $(".nas").length
    expect(result).toBe 1

  it "creates five bullets in the Nas object", ->
    nas = new Nas("body")
    result = nas.bullets.length
    expect(result).toBe 5
