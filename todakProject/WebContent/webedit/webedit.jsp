<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- SmartEditor�� ����ϱ� ���ؼ� ���� js������ �߰� (��� Ȯ��) -->
<script type="text/javascript"
	src="../webedit/dist/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<!-- jQuery�� ����ϱ����� jQuery���̺귯�� �߰� -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<!-- function �Լ� ¥���� -->

<script type="text/javascript">
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "context", //textarea���� ������ id�� ��ġ�ؾ� �մϴ�. 
			//SmartEditor2Skin.html ������ �����ϴ� ���
			sSkinURI : "../webedit/dist/SmartEditor2Skin.html",
			htParams : {
				// ���� ��� ���� (true:���/ false:������� ����),�۾�ü ����Ʈ,����,������
				bUseToolbar : true,
				// �Է�â ũ�� ������ ��� ���� (true:���/ false:������� ����)
				bUseVerticalResizer : true,
				// ��� ��(Editor | HTML | TEXT) ��� ���� (true:���/ false:������� ����)
				bUseModeChanger : true,
				fOnBeforeUnload : function() {
				}
			},
			fOnAppLoad : function() {
				//���� ����� ������ text ������ �����ͻ� �ѷ��ְ��� �Ҷ� ���
				oEditors.getById["context"].exec("PASTE_HTML", [ "" ]);
			},
			fCreator : "createSEditor2"
		});
		//�����ư Ŭ���� form ����
		$("#save").click(function() {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#edit").submit();
		});
	});
</script>

<style type="text/css">
</style>
<body>
	<!-- action/document/location -->
	<form id="edit" action="#" method="post" enctype="multipart/form-data">
		<table style="width: 50%" border="1">
			<tr>
				<td style="width: 100px">����</td>
				<td><input type="text" id="title" name="title"
					style="width: 98%" /></td>
			</tr>

			<tr>
				<td>����</td>
				<td><textarea name="context" id="context" title="����"
						style="width: 50%; height: 400px; padding: 0; margin: 0;"></textarea>
				</td>
			</tr>
			<tr>
				<td>÷������</td>
				<td>
					<input type="file" value="ã�ƺ���" id="filename1" name="filename1" /><br> 
					<input type="file" value="ã�ƺ���" id="filename2" name="filename2" /><br> 
					<input type="file" value="ã�ƺ���" id="filename3" name="filename3" />
				</td>
			</tr>
			<tr>
				<td colspan="3" align="right">
				 <input type="button" id="save" value="����" />
				 <input type="reset" value="���" /> 
				 <input type="button" value="�ӽ�����" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>