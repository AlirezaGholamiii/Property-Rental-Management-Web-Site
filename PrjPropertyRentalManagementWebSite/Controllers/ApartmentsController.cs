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
    public class ApartmentsController : Controller
    {
        private PropertyRentalManagementWebSiteDBEntities db = new PropertyRentalManagementWebSiteDBEntities();

        // GET: Apartments
        public ActionResult Index()
        {
            var apartments = db.Apartments.Include(a => a.Building).Include(a => a.Manager).Include(a => a.Owner).Include(a => a.Tenent);
            return View(apartments.ToList());
        }

        // GET: Apartments/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Apartment apartment = db.Apartments.Find(id);
            if (apartment == null)
            {
                return HttpNotFound();
            }
            return View(apartment);
        }

        // GET: Apartments/Create
        public ActionResult Create()
        {
            ViewBag.BuildingID = new SelectList(db.Buildings, "BuildingID", "Country");
            ViewBag.ManagerID = new SelectList(db.Managers, "ManagerID", "UserID");
            ViewBag.OwnerID = new SelectList(db.Owners, "OwnerID", "UserID");
            ViewBag.TenentID = new SelectList(db.Tenents, "TenentID", "UserID");
            return View();
        }

        // POST: Apartments/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ApartmentID,BuildingID,OwnerID,ManagerID,TenentID,AoartmentNumber,Status,Price,Bedrooms,Image")] Apartment apartment)
        {
            if (ModelState.IsValid)
            {
                db.Apartments.Add(apartment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BuildingID = new SelectList(db.Buildings, "BuildingID", "Country", apartment.BuildingID);
            ViewBag.ManagerID = new SelectList(db.Managers, "ManagerID", "UserID", apartment.ManagerID);
            ViewBag.OwnerID = new SelectList(db.Owners, "OwnerID", "UserID", apartment.OwnerID);
            ViewBag.TenentID = new SelectList(db.Tenents, "TenentID", "UserID", apartment.TenentID);
            return View(apartment);
        }

        // GET: Apartments/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Apartment apartment = db.Apartments.Find(id);
            if (apartment == null)
            {
                return HttpNotFound();
            }
            ViewBag.BuildingID = new SelectList(db.Buildings, "BuildingID", "Country", apartment.BuildingID);
            ViewBag.ManagerID = new SelectList(db.Managers, "ManagerID", "UserID", apartment.ManagerID);
            ViewBag.OwnerID = new SelectList(db.Owners, "OwnerID", "UserID", apartment.OwnerID);
            ViewBag.TenentID = new SelectList(db.Tenents, "TenentID", "UserID", apartment.TenentID);
            return View(apartment);
        }

        // POST: Apartments/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ApartmentID,BuildingID,OwnerID,ManagerID,TenentID,AoartmentNumber,Status,Price,Bedrooms,Image")] Apartment apartment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(apartment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BuildingID = new SelectList(db.Buildings, "BuildingID", "Country", apartment.BuildingID);
            ViewBag.ManagerID = new SelectList(db.Managers, "ManagerID", "UserID", apartment.ManagerID);
            ViewBag.OwnerID = new SelectList(db.Owners, "OwnerID", "UserID", apartment.OwnerID);
            ViewBag.TenentID = new SelectList(db.Tenents, "TenentID", "UserID", apartment.TenentID);
            return View(apartment);
        }

        // GET: Apartments/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Apartment apartment = db.Apartments.Find(id);
            if (apartment == null)
            {
                return HttpNotFound();
            }
            return View(apartment);
        }

        // POST: Apartments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Apartment apartment = db.Apartments.Find(id);
            db.Apartments.Remove(apartment);
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
