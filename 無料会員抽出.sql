SELECT '"' || u.email || '"' || ',', COALESCE(p.type, '無料会員')
FROM public."User" AS u
    LEFT JOIN public."Billing" AS  b
        ON (u.id = b.user_id)
    LEFT JOIN public."BillingPlan" AS p
        ON (b.billing_plan_id = p.id)
    LEFT JOIN public."_MailMagazineToUser" AS m
        ON (u.id = m."B")
WHERE b.user_id IS NULL
  AND m."B" IS NOT NULL; --無料会員全体送信の際はコメントアウトする
