document.addEventListener('DOMContentLoaded', () => {
    const grid = document.querySelector('.body');         // vùng lưới sản phẩm
    const base = document.querySelector('.product_1');    // thẻ mẫu ban đầu

    if (!grid || !base) return;

    // Danh sách 3 sản phẩm cần sinh thêm (thay ảnh/tên/giá theo ý bạn)
    const products = [
        {
            name: 'Samsung Smart TV QLED QA65Q65D',
            img: 'img1.jpg',
            size: '65 inch',
            res: '4K (Ultra HD)',
            price: '14.990.000đ',
            old: '20.600.000đ',
            discount: '-27%',
            gift: '900.000đ'
        },
        {
            name: 'TCL Google TV QLED 50P7K',
            img: 'img1.jpg',
            size: '50 inch',
            res: '4K (Ultra HD)',
            price: '9.290.000đ',
            old: '9.590.000đ',
            discount: '-3%',
            gift: '520.000đ'
        },
        {
            name: 'LG Smart TV 55UQ8450PSA',
            img: 'img1.jpg',
            size: '55 inch',
            res: '4K (Ultra HD)',
            price: '13.390.000đ',
            old: '15.590.000đ',
            discount: '-14%',
            gift: '900.000đ'
        }
    ];

    // Hàm đổ dữ liệu vào card đã clone
    const fillCard = (card, p) => {
        const a = card.querySelector('.product_a');
        if (a) a.href = '#';

        const img = card.querySelector('.img img');
        if (img) { img.src = p.img; img.alt = p.name; }

        const title = card.querySelector('.product_a > h3');
        if (title) title.textContent = p.name;

        const specs = card.querySelectorAll('.item_compare span');
        if (specs[0]) specs[0].textContent = p.size;
        if (specs[1]) specs[1].textContent = p.res;

        const price = card.querySelector('.price');
        if (price) price.textContent = p.price;

        const old = card.querySelector('.price_old_back');
        if (old) old.textContent = p.old;

        const percent = card.querySelector('.percent');
        if (percent) percent.textContent = p.discount;

        const gift = card.querySelector('.item_gift b');
        if (gift) gift.textContent = p.gift;
    };

    // Tạo 3 sản phẩm từ thẻ mẫu
    products.forEach(p => {
        const card = base.cloneNode(true);
        fillCard(card, p);
        grid.appendChild(card);
    });
});

document.addEventListener('DOMContentLoaded', () => {
    // Phần sinh sản phẩm của bạn giữ nguyên ở đây...

    // === Toggle Login Form ===
    const loginBtn = document.getElementById('loginBtn');
    console.log(loginBtn)
    const loginForm = document.getElementById('loginForm');

    if (loginBtn && loginForm) {
        loginBtn.addEventListener('click', () => {
            loginForm.classList.toggle('active');
        });
    }
});
