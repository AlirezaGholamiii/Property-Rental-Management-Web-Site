using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PrjPropertyRentalManagementWebSite.Models;

namespace PrjPropertyRentalManagementWebSite.Controllers
{
    public class AdminstratorController : Controller
    {
        private PropertyRentalManagementWebSiteDBEntities db = new PropertyRentalManagementWebSiteDBEntities();

        // GET: Adminstrator
        public ActionResult Index()
        {
            
            return View();
        }

        public ActionResult ListOfAdminstrator()
        {
            var adminstrators = db.Adminstrators.Include(a => a.User);
            return View(adminstrators.ToList());
        }

        // GET: Adminstrator/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Adminstrator adminstrator = db.Adminstrators.Find(id);
            if (adminstrator == null)
            {
                return HttpNotFound();
            }
            return View(adminstrator);
        }

        // GET: Adminstrator/Create
        public ActionResult Create()
        {
            ViewBag.UserID = new SelectList(db.Users, "UserID", "UseName");
            return View();
        }

        // POST: Adminstrator/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AdminstratorID,UserID,FirstName,LastName,Email,UserName,Password")] Adminstrator adminstrator)
        {
            if (ModelState.IsValid)
            {
                db.Adminstrators.Add(adminstrator);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserID = new SelectList(db.Users, "UserID", "UseName", adminstrator.UserID);
            return View(adminstrator);
        }

        // GET: Adminstrator/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Adminstrator adminstrator = db.Adminstrators.Find(id);
            if (adminstrator == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(db.Users, "UserID", "UseName", adminstrator.UserID);
            return View(adminstrator);
        }

        // POST: Adminstrator/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AdminstratorID,UserID,FirstName,LastName,Email,UserName,Password")] Adminstrator adminstrator)
        {
            if (ModelState.IsValid)
            {
                db.Entry(adminstrator).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserID = new SelectList(db.Users, "UserID", "UseName", adminstrator.UserID);
            return View(adminstrator);
        }

        // GET: Adminstrator/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Adminstrator adminstrator = db.Adminstrators.Find(id);
            if (adminstrator == null)
            {
                return HttpNotFound();
            }
            return View(adminstrator);
        }

        // POST: Adminstrator/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Adminstrator adminstrator = db.Adminstrators.Find(id);
            db.Adminstrators.Remove(adminstrator);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
