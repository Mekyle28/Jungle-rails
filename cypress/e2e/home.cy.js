
describe("homepage", () => {
  
  
  it("There is products on the page", () => {
    cy.visit("http://localhost:3000/");
    cy.get(".products article").should("be.visible");
  });
});