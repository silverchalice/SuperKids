<tr>
							  <td></td>
							  <td>
								<br />
								<h3>Previous Calls</h3>
								<br/>
							  </td>
							</tr>
							<g:if test="${customerInstance?.lastCall}">
								<g:if test="${customerInstance?.lastCall.dateCreated - new Date() < 1 }">
									<tr class="prop" id="todayCall">
								</g:if>
								<g:else>
									<tr class="prop">
								</g:else>

									<td valign="top" class="name" >
										Caller:
									</td>
									<td valign="top" class="value" id="caller">
										${customerInstance?.lastCall.caller.username}
									</td>
								</tr>

								<g:if test="${customerInstance?.lastCall.dateCreated - new Date() < 1 }">
									<tr class="prop" id="todayCall">
								</g:if>
								<g:else>
									<tr class="prop">
								</g:else>
									<td valign="top" class="name" >
										Date
									</td>
									<td valign="top" class="value" id="date">
										<g:formatDate date="${customerInstance?.lastCall.dateCreated}" format="MM/dd/yyyy" />
									</td>
								</tr>

								<g:if test="${customerInstance?.lastCall.dateCreated - new Date() < 1 }">
									<tr class="prop" id="todayCall">
								</g:if>
								<g:else>
									<tr class="prop">
								</g:else>
									<td valign="top" class="name">
										Result
									</td>
									<td valign="top" class="value" id="result">
										${customerInstance?.lastCall.result}
									</td>
								</tr>
								<g:if test="${customerInstance?.lastCall.dateCreated - new Date() < 1 }"></span></g:if>
							</g:if>

						    <g:if test="${customerInstance?.calls?.size() > 1}">
							<tr>
							  <td class="name">
							  &nbsp;
							  </td>
							  <td class="value">
							  &nbsp;
							  </td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									Caller:
								</td>
								<td valign="top" class="value">
									${customerInstance?.calls?.getAt(-2).caller.username}
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									Date
								</td>
								<td valign="top" class="value">
									<g:formatDate date="${customerInstance?.calls?.getAt(-2).dateCreated}" format="MM/dd/yyyy" />
								</td>
							</tr>


							<tr class="prop">
								<td valign="top" class="name">
									Result
								</td>
								<td valign="top" class="value">
									${customerInstance?.calls?.getAt(-2).result}
								</td>
							</tr>
							</g:if>