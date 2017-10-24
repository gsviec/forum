<div class="container">

	<ul class="nav nav-tabs">
		{%- set orders = [
			'new': 'All discussions',
			'hot': 'Hot',
			'unanswered': 'Unanswered',
			'my': 'My discussions',
			'answers':'My answers'
		] -%}
		{%- for order, label in orders -%}
			{%- if (order == 'my' or order == 'answers') and !session.get('identity') -%}
				{%- continue -%}
			{% endif -%}
			{%- if order == currentOrder -%}
				<li class="active">
			{%- else -%}
				<li>
			{%- endif -%}
				{{ link_to('discussions/' ~ order, t(label)) }}
			</li>
		{%- endfor -%}
	</ul>
</div>

{%- if posts|length -%}
<div class="container">
	<br/>
	<div align="center">
		<table class="table table-striped list-discussions" width="90%">
			<tr>
				<th width="50%">{{t('Topic')}}</th>
				<th width="10%"class="hidden-xs">{{t('Users')}}</th>
				<th width="10%"class="hidden-xs">{{t('Category')}}</th>
				<th width="10%"class="hidden-xs">{{t('Replies')}}</th>
				<th class="hidden-xs">{{t('Views')}}</th>
				<th width="10%"class="hidden-xs">{{t('Created')}}</th>
				<th width="10%"class="hidden-xs">{{t('Last Reply')}}</th>				
			</tr>
		{%- for post in posts -%}
			<tr class="{% if (post.votes_up - post.votes_down) <= -3 %}post-negative{% endif %}">
				<td align="left">

					{%- if post.sticked == "Y" -%}
						<span class="glyphicon glyphicon-pushpin"></span>&nbsp;
					{%- endif -%}
					{{- link_to('discussion/' ~ post.id ~ '/' ~ post.slug, post.title|e) -}}
					{%- if post.accepted_answer == "Y" -%}
						&nbsp;<span class="label label-success">SOLVED</span>
					{%- else -%}
						{%- if post.canHaveBounty() -%}
							&nbsp;<span class="label label-info">BOUNTY</span>
						{%- endif -%}
					{%- endif -%}

				</td>
				<td class="hidden-xs">
					{%- cache "post-users-" ~ post.id -%}
						{%- for id, user in post.getRecentUsers() -%}
						 	<a href="{{ url("user/" ~ id ~ "/" ~ user[0]) }}" title="{{ user[0] }}">
								<img src="{{user[1]}}" width="24" height="24" class="img-rounded">
							</a>
						{%- endfor -%}
					{%- endcache -%}
				</td>
				<td class="hidden-xs">
					<span class="category">{{ link_to('category/' ~ post.category.id ~ '/' ~ post.category.slug, t(post.category.name)) }}</span>
				</td>
				<td class="hidden-xs" align="center">
					<span class="big-number">{% if post.number_replies > 0 %}{{ post.number_replies }}{%endif %}</span>
				</td>
				<td class="hidden-xs" align="center">
					<span class="big-number">{{ post.getHumanNumberViews() }}</span>
				</td>
				<td class="hidden-xs">
					<span class="date">{{ post.getHumanCreatedAt() }}</span>
				</td>
				<td class="hidden-xs">
					<span class="date">{{ post.getHumanModifiedAt() }}</span>
				</td>
			</tr>
		{%- endfor -%}
		</table>
	</div>
</div>

<div class="container">
	<ul class="pager">
		{%- if offset > 0 -%}
			<li class="previous">{{ link_to(paginatorUri ~ '/' ~ (offset - limitPost), 'Prev', 'rel': 'prev') }}</li>
		{%- endif -%}

		{%- if totalPosts.count > limitPost -%}
			<li class="next">{{ link_to(paginatorUri ~ '/' ~ (offset + limitPost), 'Next', 'rel': 'next') }}</li>
		{%- endif -%}
	</ul>
</div>

{%- else -%}
<div class="container">
	<div class="alert alert-info">There are no posts here</div>
</div>
{%- endif -%}
