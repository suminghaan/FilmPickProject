// 별점 수정 안되도록 수정
const rateWrap_small = document.querySelectorAll('.rating_small'),
    label_small = document.querySelectorAll('.rating_small .rating__label_small'),
    input_small = document.querySelectorAll('.rating_small .rating__input_small'),
    labelLength_small = label_small.length,
    opacityHover_small = '0.8';

let stars_small = document.querySelectorAll('.rating_small .star-icon_small');

checkedRate_small();


rateWrap_small.forEach(wrap => {
    wrap.addEventListener('mouseenter', () => {
        stars = wrap.querySelectorAll('.star-icon_small');

        stars.forEach((starIcon, idx) => {
            starIcon.addEventListener('mouseenter', () => {
                if (wrap.classList.contains('readonly') == false) {
                    initStars_small(); // 기선택된 별점 무시하고 초기화
                    filledRate_small(idx, labelLength);  // hover target만큼 별점 active

                    // hover 시 active된 별점의 opacity 조정
                    for (let i = 0; i < stars.length; i++) {
                        if (stars[i].classList.contains('filled_small')) {
                            stars[i].style.opacity = opacityHover_small;
                        }
                    }
                }
            });

            starIcon.addEventListener('mouseleave', () => {
                if (wrap.classList.contains('readonly') == false) {
                    starIcon.style.opacity = '1';
                    checkedRate_small(); // 체크된 라디오 버튼 만큼 별점 active
                }
            });

            // rate wrap을 벗어날 때 active된 별점의 opacity = 1
            wrap.addEventListener('mouseleave', () => {
                if (wrap.classList.contains('readonly') == false) {
                    starIcon.style.opacity = '1';
                }
            });

            // readonnly 일 때 비활성화
            wrap.addEventListener('click', (e) => {
                if (wrap.classList.contains('readonly')) {
                    e.preventDefault();
                }
            });
        });
    });
});

// target보다 인덱스가 낮은 .star-icon에 .filled 추가 (별점 구현)
function filledRate_small(index, length) {
    if (index <= length) {
        for (let i = 0; i <= index; i++) {
            stars_small[i].classList.add('filled_small');
        }
    }
}

// 선택된 라디오버튼 이하 인덱스는 별점 active
function checkedRate_small() {
    let checkedRadio = document.querySelectorAll('.rating_small input[type="radio"]:checked');


    // initStars_small();
    checkedRadio.forEach(radio => {
        let previousSiblings = prevAll(radio);

        for (let i = 0; i < previousSiblings.length; i++) {
            previousSiblings[i].querySelector('.star-icon_small').classList.add('filled_small');
        }

        radio.nextElementSibling.classList.add('filled_small');

        function prevAll() {
            let radioSiblings = [],
                prevSibling = radio.parentElement.previousElementSibling;

            while (prevSibling) {
                radioSiblings.push(prevSibling);
                prevSibling = prevSibling.previousElementSibling;
            }
            return radioSiblings;
        }
    });
}

// 별점 초기화 (0)
function initStars_small() {
    for (let i = 0; i < stars.length; i++) {
        stars_small[i].classList.remove('filled_small');
    }
}