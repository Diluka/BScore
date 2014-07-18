<div class="page">
  <div class="pageContent">
    <form method="post" action="__URL__/insert/navTabId/Course" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
      <div class="pageFormContent" layoutH="58">
        <div class="panel collapse close">
          <h1>详细信息</h1>
          <div class="panelContent">
            <div class="pageFormContent">
              <fieldset>
                <legend>主选项</legend>
                <div class="unit">
                  <label>选项标题：</label>
                  <input type="text" name="MainOption_name" class="readonly" readonly>
                  <label>开始时间：</label>
                  <input type="text" name="Update_date" class="readonly" readonly>
                </div>
                <div class="unit">
                  <label>禁用时间：</label>
                  <input type="text" name="Disable_date" class="readonly" readonly>
                  <label>文档数：</label>
                  <input type="text" name="Number" class="readonly" readonly>
                </div>
              </fieldset>
              <fieldset>
                <legend>子选项</legend>
                <div class="unit">
                  <label>选项标题：</label>
                  <input type="text" name="MainOption_name" class="readonly" readonly>
                  <label>开始时间：</label>
                  <input type="text" name="Update_date" class="readonly" readonly>
                </div>
                <div class="unit">
                  <label>禁用时间：</label>
                  <input type="text" name="Disable_date" class="readonly" readonly>
                </div>
              </fieldset>
            </div>
          </div>
        </div>
        <fieldset>
          <legend>学年设置</legend>
          <div class="unit">
            <label>
              <input type="checkbox" value="1" onclick="$(this).parent().next('input').toggleClass('disabled').prop('disabled',!this.checked)"/>
              一学年&nbsp;&nbsp;文档数：</label>
            <input class="disabled textInput" disabled="disabled"/>
            <label>
              <input type="checkbox" value="2" onclick="$(this).parent().next('input').toggleClass('disabled').prop('disabled',!this.checked)"/>
              二学年&nbsp;&nbsp;文档数：</label>
            <input class="disabled textInput" disabled="disabled"/>
          </div>
          <div class="unit">
            <label>
              <input type="checkbox" value="3" onclick="$(this).parent().next('input').toggleClass('disabled').prop('disabled',!this.checked)"/>
              三学年&nbsp;&nbsp;文档数：</label>
            <input class="disabled textInput" disabled="disabled"/>
            <label>
              <input type="checkbox" value="4" onclick="$(this).parent().next('input').toggleClass('disabled').prop('disabled',!this.checked)"/>
              四学年&nbsp;&nbsp;文档数：</label>
            <input class="disabled textInput" disabled="disabled"/>
          </div>
        </fieldset>
        <!--<td><input type="checkbox" value="1" />第一学年&nbsp;<input type="checkbox" value="2" />第二学年&nbsp;<input type="checkbox" value="3" />第三学年&nbsp;<input type="checkbox" value="4" />第四学年&nbsp;</td>-->
        <fieldset>
          <legend>文档记录</legend>
          <table class="list" style="width:100%;margin:0 auto">
            <thead>
              <tr>
                <th>文档标题</th>
                <th>文档类型</th>
                <th>操作</th>
              </tr>
            </thead>
            <tbody class="childOpt" style="text-align:center">
              <tr>
                <td><input type="text" name="childOption_name" class="required" style="width:99%;"></td>
                <td><select>
                    <option value="1">{:getAttachType(1)}</option>
                    <option value="2">{:getAttachType(2)}</option>
                    <option value="3">{:getAttachType(3)}</option>
                    <option value="4">{:getAttachType(4)}</option>
                  </select></td>
                <td style="text-align:center"><a href="javascript:" style="color:lightgray"><span>删除</span></a></td>
              </tr>
            </tbody>
            <tfoot>
              <tr>
                <td colspan="4"><button type="button" onclick="childOpt_add()">添加子选项</button></td>
              </tr>
            </tfoot>
          </table>
        </fieldset>
      </div>
      <div class="formBar">
        <ul>
          <li>
            <div class="buttonActive">
              <div class="buttonContent">
                <button type="submit">保存</button>
              </div>
            </div>
          </li>
          <li>
            <div class="button">
              <div class="buttonContent">
                <button type="button" class="close">取消</button>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </form>
  </div>
</div>
