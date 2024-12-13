 // Productos disponibles
 const products = [
    { id: 1, name: "Laptop Acer Aspire 3", category: "Laptops", price: 8700, image: "product1.jpg" },
    { id: 2, name: "Laptop ASUS VivoBook 5", category: "Laptops", price: 8600, image: "product2.jpg" },
    { id: 3, name: "Laptop DELL Inspiron 15", category: "Laptops", price: 8499, image: "product3.jpg" },
    { id: 4, name: "Laptop HP Pavilion x360", category: "Laptops", price: 10999, image: "product4.jpg" },
    { id: 5, name: "Lenovo IdeaPad 3", category: "Laptops", price: 7000, image: "product5.jpg" },
    { id: 6, name: "PC gamer", category: "Computadoras", price: 25000, image: "product6.jpg" },
    { id: 7, name: "Apple Watch 3", category: "Smartwatch", price: 15000, image: "product7.jpg" },
    { id: 8, name: "Mouse Logitech", category: "Mouse", price: 1000, image: "product8.jpg" },
    { id: 9, name: "Teclado Gamer", category: "Teclados", price: 1200, image: "product9.jpg" },
    { id: 10, name: "Smartphone Samsung", category: "Smartphones", price: 8000, image: "product10.jpg" },
];

// Referencias a HTML
const cartTable = document.getElementById("items");  // Tabla de productos en el carrito
const emptyCartBtn = document.getElementById("vaciar-carrito");  // Botón para vaciar el carrito
const totalDisplay = document.getElementById("total");  // Elemento para mostrar el total

let cart = [];  // Carrito vacío inicialmente

// Función para renderizar productos en el carrito
const renderCart = () => {
    cartTable.innerHTML = "";  // Limpia el contenido previo de la tabla.

    cart.forEach((product) => {
        const row = document.createElement("tr");
        row.innerHTML = `
            <td>${product.name}</td>
            <td>${product.category}</td>
            <td>
                <div class="d-flex align-items-center">
                    <button class="btn btn-sm btn-danger" data-id="${product.id}" data-action="decrease">-</button>
                    <span class="mx-2">${product.quantity}</span>
                    <button class="btn btn-sm btn-success" data-id="${product.id}" data-action="increase">+</button>
                </div>
            </td>
            <td>$${(product.price * product.quantity).toFixed(2)}</td>
        `;
        cartTable.appendChild(row);  // Añade la fila a la tabla
    });

    calculaTotal();  // Actualiza el total después de renderizar
};

// Función para calcular el total del carrito
const calculaTotal = () => {
    const total = cart.reduce((accum, item) => accum + item.price * item.quantity, 0);  // Suma el total de todos los productos
    totalDisplay.textContent = `Total: $${total.toFixed(2)}`;  // Muestra el total en el HTML
};

// Función para vaciar el carrito
const emptyCart = () => {
    cart = [];  // Vacía el carrito
    renderCart();  // Vuelve a renderizar la tabla vacía
};

// Función para manejar clics en los botones de incremento/decremento de cantidad
const cartActions = (e) => {
    const id = parseInt(e.target.dataset.id);  // Obtiene el ID del producto
    const action = e.target.dataset.action;  // Acción de incrementar o disminuir

    if (action === "increase") {
        const product = cart.find((item) => item.id === id);  // Busca el producto en el carrito
        product.quantity++;  // Incrementa la cantidad
    } else if (action === "decrease") {
        const product = cart.find((item) => item.id === id);  // Busca el producto en el carrito
        if (product.quantity > 1) {
            product.quantity--;  // Disminuye la cantidad si es mayor a 1
        } else {
            cart = cart.filter((item) => item.id !== id);  // Si la cantidad es 1, elimina el producto
        }
    }
    renderCart();  // Vuelve a renderizar el carrito con los cambios
};

// Agregar productos de ejemplo al carrito
products.slice(0, 3).forEach((product) => {
    cart.push({ ...product, quantity: 1 });  // Añade el producto con cantidad 1
});

// Renderiza el carrito inicialmente
renderCart();

// Eventos
cartTable.addEventListener("click", cartActions);  // Escucha los clics en los botones de incrementar/disminuir
emptyCartBtn.addEventListener("click", emptyCart);  // Escucha el clic para vaciar el carrito