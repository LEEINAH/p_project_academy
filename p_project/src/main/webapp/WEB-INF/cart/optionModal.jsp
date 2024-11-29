<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>옵션 변경 모달</title>
    <style>
        /* 기본 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .product {
            display: flex;
            align-items: center;
            margin: 20px;
        }

        .product img {
            width: 100px;
            height: 100px;
            object-fit: cover;
        }

        .product-info {
            margin-left: 20px;
            outline: none;
        }
        
       	button:focus {
		    outline: none;
		    box-shadow: none;
		}

        /* 옵션 변경 버튼 */
        .btn-option {
            padding: 5px 10px;
            background-color: #000;
            color: #424242;
            border: 1px solid lightgray;
            cursor: pointer;
            border-radius: none;
            background-color: white;
        }

        /* 모달 배경 */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
        }

        /* 모달 콘텐츠 */
        .modal-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .modal-header {
            font-size: 18px;
            font-weight: bold;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }

        .modal-body {
            margin: 10px 0;
        }

        .modal-body label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
        }

        .modal-body select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .modal-footer {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .btn-add,
        .btn-change {
            padding: 10px;
            border: none;
            cursor: pointer;
            width: 40%;
        }

        .btn-add {
            background-color: #000;
            color: #fff;
        }

        .btn-change {
            background-color: #000;
            color: #fff;
        }

        .btn-close {
            position: absolute;
            top: 10px;
            right: 10px;
            background: none;
            border: none;
            font-size: 18px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <!-- 상품 리스트 -->
    <div class="product">
        <div class="product-info">
            <p style="font-size: 20px; font-weight: bold;">글로우 레더</p>
            <p style="font-size: 16px; color: #585858">[옵션: (유광) 103. 실버]</p>
            <button class="btn-option" onclick="openModal()">옵션 변경</button>
        </div>
    </div>

    <!-- 모달 -->
    <div class="modal" id="optionModal">
        <div class="modal-content">
            <button class="btn-close" onclick="closeModal()">×</button>
            <div class="modal-header">글로우 레더</div>
            <div class="modal-body">
                <label for="productOption">상품 옵션</label>
                <select id="productOption">
                    <option>- [필수] 옵션을 선택해 주세요 -</option>
                    <option value="option1">(유광) 107.화이트</option>
                    <option value="option2">(유광) 108.블랙</option>
                    <option value="option3">(유광) 109.그레이</option>
                </select>
            </div>
            <div class="modal-footer">
                <button class="btn-add">추가</button>
                <button class="btn-change">변경</button>
            </div>
        </div>
    </div>

    <script>
        // 모달 열기
        function openModal() {
            document.getElementById('optionModal').style.display = 'block';
        }

        // 모달 닫기
        function closeModal() {
            document.getElementById('optionModal').style.display = 'none';
        }
    </script>
</body>
</html>