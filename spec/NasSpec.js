(function() {
  describe("Nas", function() {
    it("appends a div-element to the target", function() {
      var nas, result;
      nas = new Nas("body");
      result = $(".nas").length;
      return expect(result).toBe(1);
    });
    return it("creates five bullets in the Nas object", function() {
      var nas, result;
      nas = new Nas("body");
      result = nas.bullets.length;
      return expect(result).toBe(5);
    });
  });

}).call(this);
